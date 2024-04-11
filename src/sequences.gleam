import gleam/io
import gleam/int
import gleam/float
import gleam/list
import gleam/result


pub fn fact(num: Int) -> Result(Int,Nil) {
  case num {
    0 -> Ok(1)
    x if x > 0 -> 
      case fact(x-1) {
        Ok(res) -> Ok(x * res)
        Error(res) -> Error(res)
      }
    _ -> Error(Nil)
  }
}

pub fn binom(a: Int, b: Int) -> Result(Int, Nil) {
  case fact(a), fact(b), fact(a-b) {
    Ok(x), Ok(y), Ok(z) -> Ok(x /{y*z})
    _,_,_ -> Error(Nil)
  }
}

pub fn first(n: Int) -> Result(Float, Nil) {
  case binom(n-1, 2) {
    Ok(bx) -> case int.power(2, int.to_float(n)) {
      Ok(px) -> Ok(int.to_float(bx) *. 1.0/.px)
      _ -> Error(Nil)
    }
    _ -> Error(Nil)
  }
}



pub fn main() {
  let res = list.range(3,100)
  |> list.map(fn(x) {result.unwrap(first(x),0.0)})
  |> float.sum
  io.debug(res)
  io.println("Hello from sequences!")
}
