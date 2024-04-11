# sequences

[![Package Version](https://img.shields.io/hexpm/v/sequences)](https://hex.pm/packages/sequences)
[![Hex Docs](https://img.shields.io/badge/hex-docs-ffaff3)](https://hexdocs.pm/sequences/)

```sh
gleam add sequences
```
```gleam
import sequences

pub fn main() {
  let res =
    list.range(3, 100)
    |> list.map(fn(x) { result.unwrap(first(x), 0.0) })
    |> float.sum
  io.debug(res) // should return 1.0
}
```

Further documentation can be found at <https://hexdocs.pm/sequences>.

## Development

```sh
gleam run   # Run the project
gleam test  # Run the tests
gleam shell # Run an Erlang shell
```
