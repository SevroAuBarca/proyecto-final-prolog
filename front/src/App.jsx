import Chat from "./components/Chat";

function App() {
  return (
    <div className="w-full max-w-xl h-full bg-gray-800 text-white">
      <h1 className="bg-gray-900 text-white p-4 rounded-b-xl before:content-[url('https://api.iconify.design/emojione:robot-face.svg')] before:mr-2">
        HarsBot
      </h1>
      <Chat />
    </div>
  );
}

export default App;
