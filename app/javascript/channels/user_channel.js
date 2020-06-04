import consumer from "./consumer";

const initUserChannelCable = () => {
  const messagesContainer = document.getElementById('messages');
  if (messagesContainer) {

    consumer.subscriptions.create({ channel: "UserChannel" }, {
      received(data) {
        messagesContainer.insertAdjacentHTML("beforeend", data); // called when data is broadcast in the cable
        window.scrollTo(0,document.body.scrollHeight);
      },
    });
  }
}

export { initUserChannelCable };
