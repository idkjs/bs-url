type t;
module WHATWG : {
  type url;
  type searchParams;

  type t = url;

  module SearchParams : {
    type t = searchParams;

    [@send] [@return nullable]
    external get: (t, string) => option(string) = "get";
  };

  [@new] external make: string => t = "URL";
  [@get] external searchParams: t => searchParams = "searchParams";
};
// let make: string => t;
let makeWithBase: (string, string) => t;
let getHash: WHATWG.t => string;
let getHost: WHATWG.t => string;
let getHostname: WHATWG.t => string;
let getHref: WHATWG.t => string;
let getOrigin: WHATWG.t => string;
let getPassword: WHATWG.t => string;
let getPathname: WHATWG.t => string;
let getPort: WHATWG.t => string;
let getProtocol: WHATWG.t => string;
let getSearch: WHATWG.t => string;
let getSearchParam: (WHATWG.t, string) => option(string);
let getSearchParams: WHATWG.t => WHATWG.SearchParams.t;
let getUsername: WHATWG.t => string;
let toString: t => string;
let toJSON: t => string;
let domainToASCII: string => string;
let domainToUnicode: string => string;
let format:
  (~auth: bool=?, ~fragment: bool=?, ~search: bool=?, ~unicode: bool=?, t) =>
  string;
let parse: string => t;
let resolve: (string, string) => t;
