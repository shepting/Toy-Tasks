//
// fizzbuzz.js
//
// From:
// http://www.codinghorror.com/blog/2007/02/why-cant-programmers-program.html
//

for (j=1;j<100;j++) {
    if (!(j%3) && !(j%5)) {
        console.log("FizzBuzz");
    } else if (!(j%3)) {
        console.log("Fizz");
    } else if (!(j%5)){
        console.log("Buzz");
    } else {
        console.log(j);
    }
}