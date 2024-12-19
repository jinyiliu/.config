import os
import socket
from urllib import request
import feedparser
from feedparser.util import FeedParserDict
from datetime import datetime, timezone
import random
from colorama import Fore, Style
import pickle


url = 'https://rss.arxiv.org/atom/astro-ph.CO'
atom_fname = '/Users/liujinyi/.config/utils/dailypapers.atom'
pickle_fname = '/Users/liujinyi/.config/utils/dailypapers.pickle'



def internet_on(url: str) -> bool:
    try:
        request.urlopen(url, timeout=1)
        return True
    except request.URLError: 
        return False


def cached_papers_today(fname: str = atom_fname) -> bool:
    now = datetime.now(timezone.utc)
    release_time = now.replace(hour=0, minute=0, second=0)
    if os.path.exists(fname):
        atom_mtime = datetime.fromtimestamp(
                os.path.getmtime(fname),
                tz = timezone.utc,
        )
        return atom_mtime > release_time
    else:
        return False


def download_atom_xml(url: str = url, fname: str = atom_fname) -> None:
    if internet_on(url):
        xml = request.urlopen(url).read().decode('utf-8')
        with open(fname, 'w') as f:
            f.write(xml)


def remove_unwanted_entry_save_to_pickle(atom_fname: str = atom_fname, pickle_fname: str = pickle_fname) -> None:
    feed = feedparser.parse(atom_fname)
    entries_raw = feed['entries']
    entries_ret = []
    for entry in entries_raw:
        if not has_unwanted_properties(entry):
            entries_ret.append(entry)

    with open(pickle_fname, 'wb') as f:
        pickle.dump(entries_ret, f)


def has_unwanted_properties(entry: FeedParserDict) -> bool:
    title = term_readable(entry['title']).lower()
    unwanted_strings = [
        'quantum',
        'quantisation',
        'axion',
        'slow-roll',
        'dark photon',
        'bubble walls',
        'graviton',
    ]
    has_unwanted_strings = any(string in title.lower() for string in unwanted_strings)

    terms = []
    for tag in entry['tags']:
        terms.append(tag['term'])
    main_category_is_gr = 'gr-qc' in terms[:2]
    main_category_is_hep = 'hep-ph' in terms[:1]
    is_replace = entry['arxiv_announce_type'] == 'replace-cross'


    if has_unwanted_strings or main_category_is_gr or main_category_is_hep or is_replace:
        return True
    else:
        return False


def random_paper_picker(fname: str = pickle_fname) -> dict:
    with open(fname, 'rb') as f:
        entries = pickle.load(f)

    if len(entries) == 0:
        return {}
    
   
    n_sample_max = 5
    n_sample = random.randint(1, n_sample_max)
    print(f'Academic news for today! {n_sample}/{len(entries)} papers.')
    randind = random.sample(range(len(entries)), n_sample)
    ret: dict[str: str] = {}
    for ind in randind:
        entry = entries[ind]
        title = term_readable(entry['title'])
        link = entry['link']
        ret[title] = link
    return ret



def term_readable(text: str) -> str:
    text = text.replace('$', '')
    # Make terminal outputs more readable
    replacements = {
        # Greek letters
        u"\\Lambda"     : 'Λ',
        r"\alpha"       : 'α',
        r"\gamma"       : 'γ',
        # Latex symbols
        r"\sim"     : '~',
        # Common quantities
        r"H_0"              : 'H0',
        r"\Omega_K"         : 'Omega_K',
        r"[H I]_{\rm 21cm}" : '[HI]_21cm',
        # French
        u"\\'o" : 'ó',
        r"\`o"  : 'ò',
        r"\^{i}": 'i',
    }
    for key, value in replacements.items():
        text = text.replace(key, value)

    return text


if __name__=='__main__':
    if not cached_papers_today():
        download_atom_xml()
        remove_unwanted_entry_save_to_pickle()
        
    
    if cached_papers_today():
        papers = random_paper_picker()
        if papers:
            for i, (title, link) in enumerate(papers.items()):
                print(f"{Style.BRIGHT}{Fore.RED}{i+1}.{Style.RESET_ALL}{Fore.WHITE} {title} ({Fore.CYAN}{link}{Fore.WHITE}){Fore.RESET}")
        else:
            print(f'No papers for today!')

