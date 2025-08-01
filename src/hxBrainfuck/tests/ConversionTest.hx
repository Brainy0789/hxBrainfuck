package tests;

import hxBrainfuck.Brainfuck;

class ConversionTest
{
    public static var bf:Brainfuck;

    static function main() {
        trace(new Brainfuck().stringToBF("Hello, world!"));
    }
}