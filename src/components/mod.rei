Card: (title: _, content: _?, page: Page) -> Component {
    @arcen Flex[on_click={route(page)}] {
        Title {title}
        Flex {content}
    }
}
