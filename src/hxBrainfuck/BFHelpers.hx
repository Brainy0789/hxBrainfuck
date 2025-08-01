package hxBrainfuck;

class BFHelpers
{
    public static function arrayizeString(string:String):Array<String>
    {
        return string.split("");
    }

    public static function input(?string:String = ""):String
    {
        Sys.stdout().writeString(string);
        Sys.stdout().flush();

        return Sys.stdin().readLine();
    }

    public static function print(?string:String = "")
    {
        haxe.Log.trace(Std.string(string), null);
    }
}