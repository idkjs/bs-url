type t
module WHATWG = {
  type url
  type searchParams

  type t = url

  module SearchParams = {
    type t = searchParams

    @send @return(nullable)
    external get: (t, string) => option<string> = "get"
  }

  @new external make: string => t = "URL"
  @get external searchParams: t => searchParams = "searchParams"
}
// [@module "url"] [@new] external make: string => t = "URL";
@module("url") @new external makeWithBase: (string, string) => t = "URL"

/* Members */
@get external getHash: WHATWG.t => string = "hash"
@get external getHost: WHATWG.t => string = "host"
@get external getHostname: WHATWG.t => string = "hostname"
@get external getHref: WHATWG.t => string = "href"
@get external getOrigin: WHATWG.t => string = "origin"
@get external getPassword: WHATWG.t => string = "password"
@get external getPathname: WHATWG.t => string = "pathname"
@get external getPort: WHATWG.t => string = "port"
@get external getProtocol: WHATWG.t => string = "protocol"
@get external getSearch: WHATWG.t => string = "search"

// type url =
//   | WHATWG(WHATWG.url);

let getSearchParam = (url, key) => url->WHATWG.searchParams->WHATWG.SearchParams.get(key)

@get external getSearchParams: WHATWG.t => WHATWG.SearchParams.t = "searchParams"
@get external getUsername: WHATWG.t => string = "username"

/* Instance Methods */
@send external toString: t => string = "toString"
@send external toJSON: t => string = "toJSON"

/* Static methods */
@module("url") @val
external domainToASCII: string => string = "domainToASCII"
@module("url") @val
external domainToUnicode: string => string = "domainToUnicode"

type formatInternal = {
  auth: bool,
  fragment: bool,
  search: bool,
  unicode: bool,
}
@module("url") @val
external formatInternal: (t, formatInternal) => string = "format"

let unwrapOptWithDefault: (option<bool>, bool) => bool = (optionalValue, default) =>
  switch optionalValue {
  | Some(v) => v
  | None => default
  }

let format = (~auth=?, ~fragment=?, ~search=?, ~unicode=?, t) =>
  formatInternal(
    t,
    {
      auth: unwrapOptWithDefault(auth, true),
      fragment: unwrapOptWithDefault(fragment, true),
      search: unwrapOptWithDefault(search, true),
      unicode: unwrapOptWithDefault(unicode, false),
    },
  )
@module("url") @val external parse: string => t = "parse"
@module("url") @val external resolve: (string, string) => t = "resolve"
