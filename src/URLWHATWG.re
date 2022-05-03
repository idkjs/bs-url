
// https://github.com/barodeur/chobchat/blob/main/mobile/src/URL.res
module WHATWG = {
  type url;
  type searchParams;

  type t = url;

  module SearchParams = {
    type t = searchParams;

    [@send] [@return nullable]
    external get: (t, string) => option(string) = "get";
  };

  [@new] external make: string => t = "URL";
  [@get] external searchParams: t => searchParams = "searchParams";
};

type url =
  | WHATWG(WHATWG.url);

let make = str => str->WHATWG.make->WHATWG;

let getSearchParam = (url, key) =>
  url->WHATWG.searchParams->(WHATWG.SearchParams.get(key));
