using System.Collections;
using System.Linq;
namespace Case
{
    internal class Program
    {
        static void Main(string[] args)
        {
            #region Filter String Values

            ArrayList list = new() { 1, "str1", 2, "str2", 3, "str3" };
            list.OfType<string>().ToList().ForEach(x => Console.WriteLine(x));


            #endregion
          
            #region Sort Numbers

            ArrayList strArray = new(){ "7", "5", "6", "2", "4", "3", "1" };
            strArray.OfType<string>().ToList().Select(x=>int.Parse(x)).OrderBy(y=>y).ToList().ForEach(x=>Console.WriteLine(x));

            #endregion
        }
    }
}
