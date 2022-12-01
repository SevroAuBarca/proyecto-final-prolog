export const fetchMessagesData = async (endpoint) => {
  const response = await fetch(`http://localhost:8080/${endpoint}`);
  return response.json();
};

export const fetchPostData = async (data, endpoint) => {
  console.log(data, endpoint);
  const response = await fetch(`http://localhost:8080/ejercicios/${endpoint}`, {
    method: "POST", // *GET, POST, PUT, DELETE, etc.
    mode: "cors", // no-cors, *cors, same-origin
    cache: "no-cache", // *d{
    headers: {
      "Content-Type": "application/json",
      // 'Content-Type': 'application/x-www-form-urlencoded',
    },
    credentials: "same-origin",
    body: JSON.stringify(data),
  });
  return response.json();
};

function ecuacion(string) {
  const parametros = string.split("=");
  console.log(parametros);
  const variable = [];
  const operaciones = [parametros[1]];
  for (let i of parametros[0]) {
    console.log(i);
    if (i !== "x") {
      switch (i) {
        case "+":
          operaciones.push("-");
          break;
        case "-":
          operaciones.push("+");
          break;
        case "*":
          operaciones.push("/");
          break;
        case "/":
          operaciones.push("*");
          break;
        default:
          operaciones.push(i);
      }
    } else variable.push(i);
  }
  console.log([...variable, "=", ...operaciones].join(""));
}

ecuacion("x+4*3=12");
