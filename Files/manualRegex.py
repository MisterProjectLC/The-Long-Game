import pyperclip, re

text = pyperclip.paste()

regex = re.compile("'(\w+)'")
text = regex.sub(r'"\1"', text)

regex = re.compile('"""')
text = regex.sub('"', text)

regex = re.compile('	    ')
text = regex.sub('', text)

#regex = re.compile(r'([^\{\],\}\n ])\n')
#text = regex.sub(r'\\n', text)

pyperclip.copy(text)
