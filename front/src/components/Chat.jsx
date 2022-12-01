import React, { useState, useRef } from "react";
import { useData } from "../hooks/useData";
import { Icon } from "./Icon";

const Chat = () => {
  const [changeData, sendMessage, divRef, message] = useData();

  return (
    <div className="relative h-4/5 flex flex-col justify-center">
      <div
        className="overflow-y-auto h-full p-4 flex flex-col gap-3 absolute w-full"
        ref={divRef}
      >
        <p className="p-2 bg-cyan-500 w-4/5">escribe "Iniciar"</p>
      </div>
      <form
        className="fixed left-0 right-0 mx-auto border-none h-14 flex sm:w-[40vw] bottom-3 bg-slate-900"
        onSubmit={sendMessage}
      >
        <input
          className={`${
            message ? "w-4/5" : "w-full"
          } h-full mb-7 bg-slate-900 px-4`}
          type="text"
          value={message}
          onChange={changeData}
        />
        <button className={`${!message && "hidden"} `} type="submit">
          <Icon />
        </button>
      </form>
    </div>
  );
};

export default Chat;
