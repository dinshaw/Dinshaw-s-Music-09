TOP_LEVEL_DOMAINS = "aero|arpa|asia|biz|cat|com|coop|edu|gov|info|int|jobs|mil|mobi|museum|name|net|org|pro|tel|travel"
# Top Level Domains: http://data.iana.org/TLD/tlds-alpha-by-domain.txt
VALID_EMAIL = /
^[A-Z0-9._%+-]+
@
[A-Z0-9.-]+
\.
(?:[A-Z]{2}|#{TOP_LEVEL_DOMAINS})$
/ix

VALID_URL = /
^(?:http|https):\/\/
[A-Z0-9.-]+
\.
(?:[A-Z]{2}|#{TOP_LEVEL_DOMAINS})$
/ix

# p 'asd@asd.com'.match(VALID_EMAIL)
# p 'asd@asd.travel'.match(VALID_EMAIL)
# p 'asd@asd.garbage'.match(VALID_EMAIL)
# 
# p 'http://asd.com'.match(VALID_URL)
# p 'http://dinshaw.us'.match(VALID_URL)
# p 'http://www.asd.com'.match(VALID_URL)
# p 'http://www.asd.c'.match(VALID_URL)