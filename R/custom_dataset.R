library(tidyverse)
library(shiny)
library(miniUI)

#' Build Custom Dataset from the Available Data
#'
#' A shiny app for building a smaller work dataset.
#'
#' @return A list with two components: summary, and data. The summary contains the
#'    variables and their descriptions and summary statistics. The data contains
#'    the built custom dataset.
#' @export
#'
#' @examples
#'
#' mydataset <- custom_dataset()
#'
custom_dataset <- function() {

    ui <- miniPage(
        gadgetTitleBar("Select your preferred variables"),
        miniContentPanel(
            fillRow(flex = c(3, 1),
                DT::dataTableOutput("all_data"),
                tableOutput("selected_data"))
        )
    )

    server <- function(input, output, session) {

        output$all_data <- DT::renderDataTable(all_world_meta)

        output$selected_data <- renderTable({
            if (!is.null(input$all_data_rows_selected)) {
                all_world_meta %>% slice(input$all_data_rows_selected) %>% select(Variable, source)
            }
        })

        df <- data.frame(a = c(1,2), b = c(3, 4))

        df_meta <- reactive({
            ifelse(!is.null(input$all_data_rows_selected),
                   all_world_meta %>% slice(input$all_data_rows_selected),
                   NULL)
        })

        # Listen for the 'done' event. This event will be fired when a user
        # is finished interacting with your application, and clicks the 'done'
        # button.
        observeEvent(input$done, {

            selected_meta <- all_world_meta %>% slice(input$all_data_rows_selected)

            fraser_vars    <- fraser    %>% select(country, year, names(fraser)   [names(fraser)    %in% selected_meta$Variable])
            manifesto_vars <- manifesto %>% select(country, year, names(manifesto)[names(manifesto) %in% selected_meta$Variable])
            qog_vars       <- qog       %>% select(country, year, names(qog)      [names(qog)       %in% selected_meta$Variable])
            ted_vars       <- ted       %>% select(country, year, names(ted)      [names(ted)       %in% selected_meta$Variable])
            vdem_vars      <- vdem      %>% select(country, year, names(vdem)     [names(vdem)      %in% selected_meta$Variable])

            df <- list(fraser_vars, manifesto_vars, qog_vars, ted_vars, vdem_vars) %>%
                reduce(full_join, by = c("country", "year"))

            returnValue <- list(summary = selected_meta,
                                data    = df)

            stopApp(returnValue)
        })
    }

    # We'll use a pane viwer, and set the minimum height at
    # 300px to ensure we get enough screen space
    # viewer <- paneViewer(300)
    runGadget(ui, server, viewer = dialogViewer("Build a custom dataset", width = 1200, height = 800))

}


