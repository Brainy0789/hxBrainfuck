package tests;

import brainfuck.Brainfuck;

class ConversionTest
{
    public static var bf:Brainfuck;

    static function main() {
        trace(new Brainfuck().stringToBF("Hello, world!"));
    }
}