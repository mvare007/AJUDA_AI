import EmojiButton from '@joeattardi/emoji-button';

const emojiPicker = () => {
  const button = document.querySelector('#emoji-button');
  if (button) {
    const picker = new EmojiButton();
    picker.on('emoji', emoji => {
      document.querySelector('#message_content').value += emoji;
    });
    button.addEventListener('click', () => {
      picker.togglePicker(button);
    });
  }
}

export { emojiPicker };
