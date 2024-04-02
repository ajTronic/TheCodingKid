from PIL import Image

def pixelToChar(p):
    grayscalePixel = sum([p[0], p[1], p[2]])//3 # 0 (black) to 255 (white)
    index = len(charMap)-1 - int(grayscalePixel//(256/len(charMap)))
    return charMap[index]

image = Image.open('images\\lena.png').convert('RGB')
outfile = "art.txt"
charMap = r"㎿亷亷乸乸乸俌俌亀俑俻俼亸亸俷侷乽俴佩便俄乗俩伵侵亵亴俸丳侇俁侢乬俛倀侥俱两侓俎佭侹侑亱佸伹亮乺修佋佶亩伛伣供俆估俘侏且佄亞侔佅侍侨何佖丝㎻仰伕㎑伶⒃乤來也㏀㎪㏍伱乐㎏伀⒀亦乑Ⓠ作代企㎴⒗⒄Ⓝ云乜丈Ⓔ仚仟㎕⑼⑹亾㎙Ⓚ⒬Ⓟ亢㎛仧ⓓ⑸ⓑ⒣Ⓧ＆义ⓋＢ㎥今㎋产Ｄ㎝乂亣久仌⒳乆㏔仒Ⓛ下ⓩⓩ上了⒐ｄｑ⒍⒯＄ⓣＵｗ㏓Ｘ个人Ｐ㏑㏄ⓛ⒋丆４丬ｋ⒉５Ｓ丅￠￠￠￠ＦＦＦｙｎ１乁乁乊ｚｚ々乀亻亻ｆ７Ｌｊｓｓ亅ｖ亠［乛丨ＪＪ｛？？（（ ＝｜｜￢￢ｒ＋＜￣￤〃丷！！！＊＊＊～～～丶丶丶。。。；；＂＂＿＿：：－，、＇＇｀．．．．．　　　　" # 256 characters

open(outfile, "w").close() # clear the file

for y in range(image.size[1]): # height
    line = ""
    for x in range(image.size[0]): # width
        line += pixelToChar(image.getpixel((x, y)))
    line += "\n"
    with open(outfile, "a",  encoding="utf-8") as file: file.write(line) # append line to file