% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/render_docker.R
\name{render_docker}
\alias{render_docker}
\alias{drender}
\title{Render Dockerized R Markdown Documents}
\usage{
render_docker(input = NULL, tag = NULL, container_name = NULL,
  cache = TRUE, purge_info = TRUE, build_args = NULL, run_args = NULL,
  ...)

drender(...)
}
\arguments{
\item{input}{Input file to render in Docker container.}

\item{tag}{Docker image name to build, sent as docker argument \code{-t}.
If not specified, it will use the same name as the input file.}

\item{container_name}{Docker container name to run.
If not specified, will use a randomly generated name.}

\item{cache}{Logical. Controls the \code{--no-cache} argument
in \code{docker run}. Setting this to be \code{TRUE} can accelerate
the rendering speed substantially for repeated/interactive rendering
since the Docker image layers will be cached, with only the changed
(knitr related) image layer being updated. Default is \code{TRUE}.}

\item{purge_info}{Logical. Should we write the Docker container and
image information to a YAML file for purging later?
Default is \code{TRUE}.}

\item{build_args}{A character string specifying additional
\code{docker build} arguments. For example,
\code{--pull=true -m="1024m" --memory-swap="-1"}.}

\item{run_args}{A character string specifying additional
\code{docker run} arguments. For example, \code{--privileged=true}.}

\item{...}{Additional arguments passed to
\code{\link[rmarkdown]{render}}.}
}
\value{
\itemize{
\item A list containing the image name, container name,
and Docker commands will be returned.
\item An YAML file ending with \code{.docker.yml} storing the
image name, container name, and Docker commands for rendering
this document will be written to the directory of the input file.
\item The rendered output will be written to the directory of the
input file.
}
}
\description{
Render dockerized R Markdown documents using Docker containers.
}
\details{
Before using this function, please run \code{\link{lift}} on the
RMD document first to generate the \code{Dockerfile}.

After a successful rendering, you will be able to clean up the
Docker image with \code{\link{purge_image}}.

Please see \code{vignette('liftr-intro')} for details of the extended
YAML metadata format and system requirements for rendering dockerized
R Markdown documents.
}
\examples{
# copy example file
dir_example = paste0(tempdir(), "/liftr-tidyverse/")
dir.create(dir_example)
file.copy(system.file("examples/liftr-tidyverse.Rmd", package = "liftr"), dir_example)

# containerization
input = paste0(dir_example, "liftr-tidyverse.Rmd")
lift(input)

\dontrun{
# render the document with Docker
render_docker(input)

# view rendered document
browseURL(paste0(dir_example, "liftr-tidyverse.pdf"))

# purge the generated Docker image
purge_image(paste0(dir_example, "liftr-tidyverse.docker.yml"))}
}
