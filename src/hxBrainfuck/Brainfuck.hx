package hxBrainfuck;

import hxBrainfuck.BFHelpers;

class Brainfuck
{
    public static var instance:Brainfuck;
    public var pointer:Int = 0;
    public var values:Array<Int> = [0];


    public function new()
    {
        instance = this;
    }

    public function interp(code:String, ?input = false, ?verbose = false):Dynamic
    {
        if (verbose) trace("Interpreting code: " + code);

        if (code == null || code == "")
        {
            BFHelpers.print("Error: No code provided.");
            return null;
        }

        if (verbose) trace("Code length: " + code.length);

        var codeArray:Array<String> = BFHelpers.arrayizeString(code);

        var useInput:Bool = false;

        for (char in codeArray) {
            if (char == ",")
            {
                useInput = true;
                break;
            }
        }

        if (verbose) trace("Using input..." + (useInput ? " Yes" : " No"));

        var inputs:Int = -1;
        var output:String = "";

        var i:Int = 0;
        var curIndex:Int = 0;
        var doLoop:Bool = false;
        var loopLength:Int = 0;

        while (i < codeArray.length)
        {
            if (verbose) trace("Current index: " + i);
            if (codeArray[i] == ">")
            {
                pointer += 1;
                if (pointer >= values.length)
                    values.push(0);

                if (verbose) trace("New pointer: " + pointer);
            }
            else if (codeArray[i] == "<")
            {
                pointer -= 1;
                if (pointer < 0)
                    pointer = 0;

                if (verbose) trace("New pointer: " + pointer);
            }
            else if (codeArray[i] == "+")
            {
                values[pointer] += 1;
                if (values[pointer] > 255)
                    values[pointer] = 0;

                if (verbose) trace("New value: " + values[pointer]);
            }
            else if (codeArray[i] == "-")
            {
                values[pointer] -= 1;
                if (values[pointer] < 0)
                    values[pointer] = 255;

                if (verbose) trace("New value: " + values[pointer]);
            }
            else if (codeArray[i] == ".")
            {
                output += String.fromCharCode(values[pointer]);
                if (verbose) trace("Added " + String.fromCharCode(values[pointer]) + " to output.");
            }
            else if (codeArray[i] == ",")
            {
                if (useInput) //kinda a just in case thing i guess
                {
                    inputs ++;
                    values[pointer] = input.charCodeAt(inputs);
                    if (verbose) trace("Read " + values[pointer] + " from input.");
                }
            }
            else if (codeArray[i] == "[")
            {
                if (values[pointer] == 0)
                {
                    // Jump forward to matching ]
                    var open = 1;
                    while (open > 0)
                    {
                        i++;
                        if (i >= codeArray.length) {
                            BFHelpers.print("Error: Unmatched [");
                            return null;
                        }

                        if (codeArray[i] == "[") open++;
                        else if (codeArray[i] == "]") open--;
                    }
                }
            }
            else if (codeArray[i] == "]")
            {
                if (values[pointer] != 0)
                {
                    // Jump back to matching [
                    var close = 1;
                    while (close > 0)
                    {
                        i--;
                        if (i < 0) {
                            BFHelpers.print("Error: Unmatched ]");
                            return null;
                        }

                        if (codeArray[i] == "]") close++;
                        else if (codeArray[i] == "[") close--;
                    }
                }
            }

            i ++;
        }
        return output;
    }

    public function stringToBF(s:String, ?clean=false):String {
        var code:String = "";
        var array:Array<String> = BFHelpers.arrayizeString(s);

        for (char in array) {
            var curChar:Int = char.charCodeAt(0);  // <-- always 0, not i

            for (j in 0...curChar)
                code += "+";

            code += ".";

            if (clean) {
                code += "   " + char;
                code += "\n";
            }

            code += "[-]";
        }

        return code;
    }


}