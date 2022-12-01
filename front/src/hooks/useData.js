import { useState, useRef } from "react";
import { fetchMessagesData, fetchPostData } from "../services";

export const useData = () => {
  const [message, setMessage] = useState("");
  const [difficult, setDifficult] = useState("");
  // const [messages, setMessages] = useState([
  //   '<p className="p-2 bg-cyan-500 w-4/5">escribe "Iniciar"</p>',
  // ]);
  const divRef = useRef(null);

  const values = {
    iniciar: "bienvenida",
    a: "informacion",
    b: "ejercicios",
    c: "hars",
    d: "finalizar",
    facil: "ejercicios/facil",
    medio: "ejercicios/medio",
    dificil: "ejercicios/dificil",
  };

  const sendMessage = async (event) => {
    event.preventDefault();
    // setMessages((prev) =>
    //   prev.push(`<p className="p-2 bg-cyan-500 w-4/5">${message}"</p>`)
    // );
    appendData(message, "right");
    message.toLowerCase();

    if (difficult) {
      postData(difficult, message);
    }

    if (message === "facil" || message === "medio" || message === "dificil") {
      setDifficult(message);
    }

    values[message] && getMessages(values[message]);
  };

  const getMessages = async (messageFetch) => {
    const data = await fetchMessagesData(messageFetch);
    iterateData(data.body);
    setMessage("");
  };

  const postData = async (messageFetch, data) => {
    if (messageFetch === "facil") {
      const splitAndCleanData = data
        .split(" ")
        .filter((data) => /[0-9]/.test(data))
        .map((data) => parseFloat(data));
      const response = await fetchPostData(
        { valuesEasy: splitAndCleanData },
        messageFetch
      );
      appendData(
        "El Resultado de la operacion es: " + response.resultEasy,
        "left"
      );
      setDifficult("");
      getMessages("opciones");
    } else if (messageFetch === "medio") {
      const splitAndCleanData = data.split(",");
      const [x, y] = splitAndCleanData;
      const newValueArray = x
        .split(" ")
        .filter((data) => /[0-9]/.test(data))
        .map((data) => parseInt(data));
      const newValuePow = parseInt(y);
      const response = await fetchPostData(
        { valuesMedium: newValueArray, powNumber: newValuePow },
        messageFetch
      );
      appendData(
        "El Resultado de la operacion es: " + response.resultMedium,
        "left"
      );
      setDifficult("");
      getMessages("opciones");
    } else if (messageFetch === "dificil") {
      const splitAndCleanData = data.split(",");
      const [x, y] = splitAndCleanData;
      const newXValue = x
        .split(" ")
        .filter((data) => /[0-9]/.test(data))
        .map((data) => parseFloat(data));
      const newYValue = y
        .split(" ")
        .filter((data) => /[0-9]/.test(data))
        .map((data) => parseFloat(data));
      const response = await fetchPostData(
        { x: newXValue, y: newYValue },
        messageFetch
      );
      console.log(response);
      appendData(
        "El Resultado de la operacion es este, son muchas variables:",
        "left"
      );
      setDifficult("");
      getMessages("opciones");
    }
  };

  const changeData = (event) => {
    setMessage(event.target.value);
  };

  const iterateData = (data) => {
    for (const item of data) {
      appendData(item, "left");
    }
  };

  const appendData = (data, direction) => {
    const messageData = document.createElement("p");
    messageData.classList.add(
      ...`p-2 ${direction === "left" ? "bg-cyan-500" : "bg-indigo-600"} ${
        direction === "right" && "self-end"
      } w-4/5`.split(" ")
    );
    messageData.innerText = data;

    divRef.current.appendChild(messageData);
  };

  return [changeData, sendMessage, divRef, message];
};
