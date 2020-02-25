'Heuristics Miner in R.

Usage:
  heuristics.R <input-file> <output-file> [--input-format=<input-format> --output-format=<output-format> --threshold=<threshold>]
  heuristics.R (-h | --help)
  heuristics.R --version

Options:
  -h --help                           Show this screen.
  --version                           Show version.
  --output-format=<output-format>     Output file format [default: cnet].           
  --input-format=<input-format>       Input file format [default: xes].
  --threshold=<threshold>             Dependency threshold [default: 0.9].
' -> doc

library(docopt)
arguments <- docopt(doc, version = paste0('Heuristics Miner ', packageVersion("heuristicsmineR")))

Sys.setenv(TZ="UTC") # fix warning in docker (https://github.com/rocker-org/rocker-versioned/issues/89)

if (arguments$`input-format` == "csv") {
  log <- readr::read_csv(arguments$`input-file`)  
  log <- bupaR::simple_eventlog(log, 
                         case_id = "case_id",
                         activity_id = "activity_id",
                         timestamp = "timestamp")
} else {
  log <- xesreadR::read_xes(arguments$`input-file`)  
}

cnet <- heuristicsmineR::causal_net(log,
                                    dependencies = heuristicsmineR::dependency_matrix(log,
                                        dependency_type = heuristicsmineR::dependency_type_fhm(threshold_dependency = arguments$threshold,
                                                                                               threshold_frequency = 0,
                                                                                               endpoints_connected = TRUE)))

cnet_graph <- heuristicsmineR::render_causal_net(cnet, rankdir = "TB")

fileConn<-file(arguments$`output-file`)
if (arguments$`output-format` == "cnet") {
  writeLines(c(DiagrammeRsvg::export_svg(cnet_graph)), fileConn)
} else {
  pnet_graph <- petrinetR::render_PN(heuristicsmineR::as.petrinet(cnet))
  writeLines(c(DiagrammeRsvg::export_svg(pnet_graph)), fileConn)
}
close(fileConn)