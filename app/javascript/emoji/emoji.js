// Emoji Picker

 import EmojiButton from '@joeattardi/emoji-button';

const button = document.querySelector('#emoji-button');
const picker = new EmojiButton();

picker.on('emoji', emoji => {
  document.querySelector('.form-control').value += emoji;
});

button.addEventListener('click', () => {
  picker.togglePicker(button);
});
