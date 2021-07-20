package net.codetojoy.fortyfives;

class ApiResult {
    private String cards;
    private String message;

    public String getCards() { return cards; }
    public void setCards(String cards) { this.cards = cards; }

    public String getMessage() { return message; }
    public void setMessage(String message) { this.message = message; }

    public String toString() {
        return "cards: " + cards + " message: " + message;
    }
}
