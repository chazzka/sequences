import gleeunit
import gleeunit/should
import sequences
import gleam/list
import gleam/result
import gleam/float

pub fn main() {
  gleeunit.main()
}

pub fn fact_test() {
  sequences.fact(5)
  |> should.equal(Ok(120))

  sequences.fact(0)
  |> should.equal(Ok(1))

  sequences.fact(-1)
  |> should.equal(Error(Nil))
}

pub fn binom_test() {
  sequences.binom(5, 1)
  |> should.equal(Ok(5))

  sequences.binom(5, 2)
  |> should.equal(Ok(10))

  sequences.binom(5, 0)
  |> should.equal(Ok(1))
}

pub fn first_test() {
  list.range(3, 100)
  |> list.map(fn(x) { result.unwrap(sequences.first(x), 0.0) })
  |> float.sum
  |> should.equal(1.0)
}
