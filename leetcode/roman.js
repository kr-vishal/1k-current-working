let reverse = (arr) => {
    let result = "";

    for( index = arr.length - 1; index > -1; index-- ){
        result = `${result}${arr[index]}`;
    }

    return result;
}
var addTwoNumbers = function(l1, l2) {
    let first = parseInt( reverse(l1) );
    let second = parseInt( reverse(l2) );
    
    let result = first + second;

    return reverse(Array.from(String(result))); 
};

addTwoNumbers([1,2,3], [2,3,4]);