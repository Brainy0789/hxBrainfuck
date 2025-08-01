package hxBrainfuck;

import hxBrainfuck.Brainfuck;

class Main
{
    static var bf:Brainfuck;
    static function main()
    {
        bf = new Brainfuck();
        trace(bf.interp(bf.stringToBF("Hello, world!")));
        //trace(bf.stringToBF("Hello, world!"));
    }
}