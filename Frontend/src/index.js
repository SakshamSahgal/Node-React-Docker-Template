import ReactDOM from 'react-dom/client';
import App from './App';
import axios from 'axios';
import 'bootstrap/dist/css/bootstrap.min.css';

axios.defaults.baseURL = process.env.REACT_APP_BASE_URL + "/api";
// console.log(process.env.REACT_APP_BASE_URL);
const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(
    <App />
);
