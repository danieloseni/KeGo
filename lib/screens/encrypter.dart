import 'dart:math';

class Encrypter{
  convertToAscii(value){
      var characters = [
        'aa','aa','aa','aa','aa','aa','aa','aa','aa','aa','aa','aa','aa','aa','aa','aa','aa','aa','aa','aa',
        'aa','aa','aa','aa','aa','aa','aa','aa','aa','aa','aa','aa', ' ','!','"','#','\$','%','&','\'','(',')',
        '*','+',',','-','.','/','0','1','2','3','4','5','6','7','8','9',':',';','<','=','>','?','@','A',
        'B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z',
        '[','\\',']','^','_','`','a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s',
        't','u','v','w','x','y','z','{','|','}','~','aa'
      ];

      for(int i = 0; i <= 127; i++){
        if(value == characters[i]){
          return i;
        }
      }
      
      
  }

  convertToCharacter(value){
    var characters = [
        'aa','aa','aa','aa','aa','aa','aa','aa','aa','aa','aa','aa','aa','aa','aa','aa','aa','aa','aa','aa',
        'aa','aa','aa','aa','aa','aa','aa','aa','aa','aa','aa','aa', ' ','!','"','#','\$','%','&','\'','(',')',
        '*','+',',','-','.','/','0','1','2','3','4','5','6','7','8','9',':',';','<','=','>','?','@','A',
        'B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z',
        '[','\\',']','^','_','`','a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s',
        't','u','v','w','x','y','z','{','|','}','~','aa'
      ];

      return characters[value].toString();
  }

  convertToBinary(value){
      var remainders = [];
      value = int.parse(value);
      int main = value;
      
             
      while(main > 0){
        remainders.add((main % 2));
        main = (main / 2).floor();
      }

      //var reversedRemainder = remainders.reversed;
      var wholeBinary = "";
      
      for(int i = (remainders.length) - 1; i >= 0; i--){
          wholeBinary += remainders[i].toString();
      }
      return wholeBinary;

  }

  binaryToDec(value){
    var digits = 0;
    var index = 0;
    for(int i = (value.toString().length) - 1; i >= 0; i--){
        var character = value[index];
        //digits = 2^2;
        digits += (int.parse(character) * pow(2,i));
        index += 1;
    }
    return digits;
  }

  appendZeros(binary){
    if(binary.toString().length == 1){
            binary = "000000" + binary;
          }else if(binary.toString().length == 2){
            binary = "00000" + binary;
          }
          else if(binary.toString().length == 3){
            binary = "0000" + binary;
          }
          else if(binary.toString().length == 4){
            binary = "000" + binary;
          }
          else if(binary.toString().length == 5){
            binary = "00" + binary;
          }
          else if(binary.toString().length == 6){
            binary = "0" + binary;
          }
      return binary;
  }

  generate9000(){
    var rand = new Random();
    var the9000 = "";
    for(int i = 0; i < 9000; i++){
      the9000 += (rand.nextInt(2)).toString();
    }
    return the9000;

  }

  encode(value){
      var ascii;
      var binary;
      var binaryWhole = "";
            
      for(int i = 0; i < value.toString().length; i++){
          ascii = convertToAscii(value[i]); //gets the ascii value of the character
          binary = convertToBinary(ascii.toString()); //converts the ascii value to binary
          binary = appendZeros(binary);
          binaryWhole += binary.toString(); //concatenates all the binaries together
      } 
      //return binaryWhole;
      binaryWhole = generate9000() + binaryWhole;
      binaryWhole = binaryWhole + generate9000();
      return binaryWhole;
  }

  test(){
    return encode("This is to test something.");
  }
  decode(value){
      //value = test();
      var fullString = "";
      var theMain = "";
      for(int i = 9000; i < value.toString().length && i < (value.toString().length - 9000); i ++){
          theMain += value[i];
      }
      
      int firstIndex = 0;
      int secondIndex = 6;
      while(firstIndex < theMain.length){
        var oneLetter = "";
        for(int i = firstIndex; i <= secondIndex; i++){
          oneLetter += theMain[i];
        }
        //return oneLetter;
        fullString += convertToCharacter(binaryToDec(oneLetter));
        firstIndex += 7;
        secondIndex += 7;

      }

      //1111001
      //1100101
      //1110011
      
      return fullString;
  }
}