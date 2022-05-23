function camelCase(str) {
  return str.replace(/[ -]+(\w)/g, (match, char) => char.toUpperCase());
}

function makeCode({ name, code }) {
  return `static const IconData ${camelCase(name)} = IconData(0${code.substr(
    2,
    5
  )}, fontFamily: 'antd-icons');\n`;
}

Array.from(document.querySelectorAll(".unicode .dib"))
  .map((element) => {
    return {
      name: element.querySelector(".name").innerText,
      code: element.querySelector(".code-name").innerText,
    };
  })
  .map(makeCode)
  .join("\n");
