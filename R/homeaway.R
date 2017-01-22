#' Return all results by team
#'
#' @param df the results dataset
#' @return a dataframe of all games by team
#' @importFrom magrittr "%>%"
#' @examples
#' homeaway(england[england$Season==2015 & england$tier==1,])
#'
#' @export

homeaway <- function(df){
    ga<-Date<-Season<-team<-opp<-gf<-division<-tier<-venue<-home<-visitor<-hgoal<-vgoal<-NULL
    rbind(df %>% dplyr::select(Date,Season,team=home,opp=visitor,gf=hgoal,ga=vgoal,division,tier) %>% dplyr::mutate(venue="home"),
          df %>% dplyr::select(Date,Season,team=visitor,opp=home,gf=vgoal,ga=hgoal,division,tier) %>% dplyr::mutate(venue="away")
    ) %>% dplyr::arrange(team,Date)
  }