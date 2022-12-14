% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/project-run.R
\name{mlflow_run}
\alias{mlflow_run}
\title{Run an MLflow Project}
\usage{
mlflow_run(
  uri = ".",
  entry_point = NULL,
  version = NULL,
  parameters = NULL,
  experiment_id = NULL,
  experiment_name = NULL,
  backend = NULL,
  backend_config = NULL,
  env_manager = NULL,
  storage_dir = NULL
)
}
\arguments{
\item{uri}{A directory containing modeling scripts, defaults to the current directory.}

\item{entry_point}{Entry point within project, defaults to `main` if not specified.}

\item{version}{Version of the project to run, as a Git commit reference for Git projects.}

\item{parameters}{A list of parameters.}

\item{experiment_id}{ID of the experiment under which to launch the run.}

\item{experiment_name}{Name of the experiment under which to launch the run.}

\item{backend}{Execution backend to use for run.}

\item{backend_config}{Path to JSON file which will be passed to the backend. For the Databricks backend,
it should describe the cluster to use when launching a run on Databricks.}

\item{env_manager}{If specified, create an environment for the project using the specified environment manager.
Available options are 'local', 'virtualenv', and 'conda'.}

\item{storage_dir}{Valid only when `backend` is local. MLflow downloads artifacts from distributed URIs passed to
parameters of type `path` to subdirectories of `storage_dir`.}
}
\value{
The run associated with this run.
}
\description{
Wrapper for the `mlflow run` CLI command. See
https://www.mlflow.org/docs/latest/cli.html#mlflow-run for more info.
}
\examples{
\dontrun{
# This parametrized script trains a GBM model on the Iris dataset and can be run as an MLflow
# project. You can run this script (assuming it's saved at /some/directory/params_example.R)
# with custom parameters via:
# mlflow_run(entry_point = "params_example.R", uri = "/some/directory",
#   parameters = list(num_trees = 200, learning_rate = 0.1))
install.packages("gbm")
library(mlflow)
library(gbm)
# define and read input parameters
num_trees <- mlflow_param(name = "num_trees", default = 200, type = "integer")
lr <- mlflow_param(name = "learning_rate", default = 0.1, type = "numeric")
# use params to fit a model
ir.adaboost <- gbm(Species ~., data=iris, n.trees=num_trees, shrinkage=lr)
}


}
