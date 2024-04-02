def getCharactersInRange(start, stop, ignores = []):
    chars = ""
    rng = range(start, stop+1)
    for n in rng:
        if chr(n) in ignores: continue # skip ignores
        chars += chr(n)
    return chars

# add characters
chars = ""
chars += getCharactersInRange(0xFF01, 0xFF5E) # Fullwidth ASCII variants    https://unicode-explorer.com/b/FF00
chars += getCharactersInRange(0xFFE0, 0xFFE6) # Fullwidth symbol variants   https://unicode-explorer.com/b/FF00
chars += getCharactersInRange(0x2474, 0x24E9) # Enclosed Alphanumerics      https://unicode-explorer.com/b/2460
chars += getCharactersInRange(0x4E00, 0x5000) # CJK Unified Ideographs      https://unicode-explorer.com/b/4E00
chars += getCharactersInRange(0x3000, 0x3007) # CJK Symbols and Punctuation https://unicode-explorer.com/b/3000
chars += getCharactersInRange(0x3380, 0x33DF) # CJK Compatibility           https://unicode-explorer.com/b/3300

# write to file
with open('chars.txt', 'w', -1, 'utf-8') as output:
    for c in chars: output.write(c)
