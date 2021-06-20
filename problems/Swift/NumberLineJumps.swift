/*

You are choreographing a circus show with various animals. For one act, you are given two kangaroos on a number line ready to jump in the positive direction (i.e, toward positive infinity).
  1. The first kangaroo starts at location x1 and moves at a rate of v1 meters per jump.
  2. The second kangaroo starts at location x2 and moves at a rate of v2 meters per jump.
You have to figure out a way to get both kangaroos at the same location at the same time as part of the show. If it is possible, return YES, otherwise return NO.

Image ref: https://s3.amazonaws.com/hr-assets/0/1516005283-e74e76ff0c-kangaroo.png
*/



func kangaroo(x1: Int, v1: Int, x2: Int, v2: Int) -> String {
    if v1 > v2 && (x2-x1)%(v1-v2)==0{
        return "YES"
    } else {
        return "NO"
    }
}
