/**
 * @param {string} s
 * @return {number}
 */
var romanToInt = function(s) {
  let values = {
      M : 1000,
      D : 500,
      C : 100,
      L : 50,
      X : 10,
      V : 5,
      I : 1
  };

  let biggestChar;

  for ( const [key,value] of Object.entries( values ) ) {
      for( index = 0; index < s.length; index++ ){
          if( s.indexOf(key) != false ){
              biggestChar = key;
              break;
          }
      }
  }

  console.log(biggestChar)
  
};