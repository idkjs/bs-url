type t

type pair<'a> = (string, 'a)

module Iter = {
  type t
  type s<'a> = {
    value: 'a,
    done_: bool,
  }

  @get external value: s<'a> => 'a = "value"
  @get external done_: s<'a> => bool = "done"

  @send external next: (t, unit) => s<'a> = "next"
}

/* Constructor */
@module("url") @new external make: string => t = "URLSearchParams"

@module("url") @new
external makeWithObject: {..} => t = "URLSearchParams"

@module("url") @new
external makeWithArray: array<pair<'a>> => t = "URLSearchParams"

/* Members */
@send external append: (string, string) => unit = "append"
@send external delete: string => unit = "delete"
@send external entries: unit => Iter.t = "entries"
@send external forEach: (pair<'a> => 'b) => unit = "forEach"
@send external get: string => string = "get"
@send external getAll: string => array<'a> = "getAll"
@send external has: string => bool = "has"
@send external keys: unit => Iter.t = "keys"
@send external set: string => string = "set"
@send external sort: t => unit = "sort"
@send external toString: t => string = "toString"
@send external values: unit => Iter.t = "values"
