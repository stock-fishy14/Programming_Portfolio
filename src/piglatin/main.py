
def toHog(phrase):
    vowels = ["a","e","i","o","u","y"]
    phrase = phrase.lower()
    length = len(phrase)
    counter = 1
    if length >= 3: #check to see word is big enough
      firstPart = phrase #
      lastPart = 'ay'      

      firstL = phrase[0]
      

      for i in range(len(vowels)):
        if phrase[counter] not in vowels:
          firstL = firstL + phrase[counter]
          counter = counter + 1
          

      if not "a" in firstL and not "e" in firstL and not "i" in firstL and not "o" in firstL and not "u" in firstL and not "y" in firstL:           
        
        firstPart = phrase[counter:int(length)]
        lastPart = firstL + 'ay'


      return (firstPart + "-" + lastPart )
    else:
      return phrase
def separateElements(phrase):
  sep = []
  word = ""
  for i in range(len(phrase)):
    if phrase[i] == " ":
      sep.append(word)
      word = ""
    else:
      word = word + phrase[i]
  sep.append(word)
  return sep

while True:
  words = input("Enter a word: ")
  
  sepword = separateElements(words)
  
  newWords = ''
  for i in range(len(sepword)):
    newWords = newWords + toHog(sepword[i]) + " "
  print(newWords)