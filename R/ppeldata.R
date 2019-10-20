#' Quality of Government dataset
#'
#' The full cross-section standard panel data.
#'
#' @docType data
#'
#' @usage data(qog)
#'
#' @keywords datasets
#'
#' @references Teorell, Jan et al. 2018. The Quality of Government Standard Dataset,
#'    Version Jan18. University of Gothenburg: The Quality of Government Institute.
#' (\href{https://qog.pol.gu.se/data/datadownloads/qogstandarddata}{Quality of Government Institute})
#'
#' @source \href{https://qog.pol.gu.se/data/datadownloads/qogstandarddata}{Quality of Government Institute}
#'
#' @examples
#' data(qog)
#'
"qog"


#' Varieties of Democracy full dataset
#'
#' The full cross-section panel data: Country-Year: V-Dem Full+Others
#' All 450+ V-Dem indicators and indices + 59 other indicators from other data sources.
#'
#' @docType data
#'
#' @usage data(vdem)
#'
#' @keywords datasets
#'
#' @references
#' Coppedge, Michael, John Gerring, Carl Henrik Knutsen, Staffan I. Lindberg, Jan Teorell,
#' David Altman, Michael Bernhard, M. Steven Fish, Adam Glynn, Allen Hicken, Anna Lührmann,
#' Kyle L. Marquardt, Kelly McMann, Pamela Paxton, Daniel Pemstein, Brigitte Seim, Rachel Sigman,
#' Svend-Erik Skaaning, Jeffrey Staton, Steven Wilson, Agnes Cornell, Lisa Gastaldi, Haakon Gjerløw,
#' Nina Ilchenko, Joshua Krusell, Laura Maxwell, Valeriya Mechkova, Juraj Medzihorsky, Josefine Pernes,
#' Johannes von Römer, Natalia Stepanova, Aksel Sundström, Eitan Tzelgov, Yi-ting Wang, Tore Wig,
#' and Daniel Ziblatt. 2019. "V-Dem [Country-Year/Country-Date] Dataset v9",
#' _Varieties of Democracy (V-Dem) Project_. \href{https://doi.org/10.23696/vdemcy19}
#'
#' Pemstein, Daniel, Kyle L. Marquardt, Eitan Tzelgov, Yi-ting Wang, Juraj Medzihorsky, Joshua Krusell,
#' Farhad Miri, and Johannes von Römer. 2019. “The V-Dem Measurement Model: Latent Variable Analysis
#' for Cross-National and Cross-Temporal Expert-Coded Data”, V-Dem Working Paper No. 21. 4th edition.
#' University of Gothenburg: Varieties of Democracy Institute.
#'
#' @source \href{https://www.v-dem.net/en/data/data-version-9/}{Varieties of Democracy}
#'
#' @examples
#' data(vdem)
#'
"vdem"

#' United States State Policies
#'
#' The Ruger and Sorens Database of State and Local Public Policies and Policy Ideology Indices (2018)
#'
#' The `statepolicy_meta` contains the variable descriptions and original sources.
#' The `statepolicy` constains the data.
#'
#' @docType data
#'
#' @usage
#'    data(statepolicy)
#'    data(statepolicy_meta)
#'
#' @keywords datasets
#'
#' @references
#' Jason Sorens, Fait Muedini and William P. Ruger. 2008. "U.S. State and Local Public Policies in 2006: A New Database." _State Politics and Policy Quarterly_
#' vol 8, no 3, pp 309-326.
#'
#' @source \href{http://www.statepolicyindex.com/data/}{State Policy Database}
#'
#' @examples
#' data(statepolicy)
#' data(statepolicy_meta)
#'
"statepolicy"

#' Fraser Economic Freedom of the World
#'
#' The components of the Fraser index of Economic Freedom.
#'
#' The following variables are the five aggregated subcomponents:
#' Size_of_Government, Property_Rights, Sound_Money, Trade, Regulation.
#'
#' The variables range from 0 to 10, with 10 describing highest economic freedom. E.g.
#' if Size_of_Government is closer to 10 it means the government involvement in the economy
#' is smaller; if Regulation is closer to 10 it means there are fewer regulations.
#'
#' The `statepolicy_meta` contains the variable descriptions and original sources.
#' The `statepolicy` constains the data.
#'
#' @docType data
#'
#' @usage
#'    data(fraser)
#'
#' @keywords datasets
#'
#' @references
#' Gwartney, James D., Robert Lawson, and Joshua Hall. 2017. _Economic Freedom of the World 2017 Annual Report_.
#' Vancouver: The Fraser Institute.
#  \href{https://www.fraserinstitute.org/economic-freedom/dataset}
#'
#' @source \href{https://www.fraserinstitute.org/economic-freedom}{Fraser}
#'
#' @examples
#' data(fraser)
#'
"fraser"