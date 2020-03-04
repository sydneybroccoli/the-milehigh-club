import "bootstrap";
import flatpickr from "flatpickr";
import 'mapbox-gl/dist/mapbox-gl.css';
import "../plugins/init_flatpickr.js"
import { initMapbox } from '../plugins/init_mapbox';

initMapbox();

import {updateEditModal} from "./modal_aircraft_form";

import "../plugins/init_flatpickr.js"

updateEditModal()

