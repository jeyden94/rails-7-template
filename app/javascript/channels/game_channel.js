import consumer from "channels/consumer"

consumer.subscriptions.create("GameChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
  }
});

import consumer from "./consumer"

document.addEventListener('turbo:load', () => {
  const gameElement = document.getElementById('game-id');
  if (gameElement) {
    const gameId = gameElement.dataset.gameId;

    consumer.subscriptions.create({ channel: "GameChannel", game_id: gameId }, {
      received(data) {
        // Update the DOM or perform actions with the received data
        document.getElementById('game-lobby').innerHTML = data.html;
      }
    });
  }
});
