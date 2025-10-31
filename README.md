# hxBrainfuck

A Brainfuck interpreter written in Haxe. Lightweight, easy to use, and extensible

## Usage

``` haxe
package;

import hxBrainfuck.Brainfuck;

class Test
{
    var brainfuck:Brainfuck;

    static function main()
    {
        brainfuck = new Brainfuck();
        trace(brainfuck.interp("+[+.]")); //simple program that loops through every ASCII character and prints it.

        //hxBrainfuck also includes a function to convert strings into Brainfuck programs.
        
        trace(brainfuck.interp(brainfuck.stringToBF("Hello, World!")));
    }
}
```
