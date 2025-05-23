<script setup lang="ts">
import TeamAvatarLayout from "@/TeamAvatarLayout.vue";
import MultiPersonAvatar from "@/MultiPersonAvatar.vue";
import padaliniai from "./data/padaliniai.csv"
import { getPersonsByRole, getPersonsByColumn, getPersonsByDepartment, getPersonByName, TeamMember } from "@/lib/personUtils";

import teamPhotos from "./data/teamPhotos.json";
import PhotoGrid from '../components/PhotoGrid.vue'

// Get all representatives coordinators from all units
const atstovai = getPersonsByRole("Atstovų koordinator", "padaliniai");

// Get academic process coordinators  
const akademiniai = getPersonsByRole("Akademinio proceso", "padaliniai");

// Get social process coordinators
const socialiniai = getPersonsByRole("Socialinio proceso", "padaliniai");

// Get communication coordinators
const komunikaciniai = getPersonsByRole("Komunikacijos koordinator", "padaliniai");

// Get marketing coordinators
const marketinginiai = getPersonsByRole("Marketing", "padaliniai");

// Get organizational coordinators
const organizaciniai = getPersonsByRole("Organizacinės srities koordinator", "padaliniai");

// Get Žmogiškųjų išteklių koordinatorius
const zmogiskieji = getPersonsByRole("Žmogiškųjų išteklių koordinator", "padaliniai");

// Get integration coordinators
const integracija = getPersonsByRole("Integracijos proceso koordinator", "padaliniai");

const isac = getPersonsByRole("Tarptautinių studentų reikalų koordinator", "padaliniai");

// administratoriai

const administratoriai = getPersonsByRole("Administrator", "padaliniai");

const cb = getPersonsByDepartment("Centrinis biuras", "dariniai");

const sic = getPersonsByDepartment("VU SA Studentų iniciatyvų centras", "dariniai");

const pirmininkai = getPersonsByRole(["Pirminink", "l.e.p. Pirminink"], "padaliniai");
const prezidente = getPersonsByRole("Prezidentė", "dariniai");
prezidente[0].padalinys = undefined;
prezidente[0].fullTerm = true;

const taryba = [
  prezidente[0],
  ...pirmininkai,
];

const isf = getPersonsByColumn("Darinys", "VU SA Institucinio stiprinimo fondas", "dariniai");

const dag = getPersonsByColumn("Darinys", "VU SA Duomenų apsaugos grupė", "dariniai");

const iniciatyvos = getPersonsByColumn("Padalinys", "Iniciatyvos", "padaliniai");

</script>

# Ačiū, kad esate kartu

![VU SA](</img/dariniai/VU SA.jpg>)

## Sritys

<PhotoGrid :photos="teamPhotos.lt" />

## Centrinis biuras

![Centrinis biuras](</img/dariniai/CB.jpg>)

<TeamAvatarLayout :members="cb" :showTitle="true" :showPadalinys="false" />

## VU SA Taryba

![Taryba](</img/dariniai/Taryba.jpg>)

<TeamAvatarLayout :members="taryba" :showTitle="false" :showPadalinys="true" />

Daugiau apie Tarybą [skaitykite čia](/vu-sa/taryba.md).

## VU SA Parlamentas

![Parlamentas](</img/dariniai/Parlamentas.jpg>)

Daugiau apie Parlamentą [skaitykite čia](/vu-sa/parlamentas.md).

## ISF

<TeamAvatarLayout :members="isf" :showTitle="true" :showPadalinys="false" />

Daugiau apie ISF [skaitykite čia](/stipri-organizacija/isf.md).

## Duomenų apsaugos grupė

![DAG](</img/dariniai/DAG.jpg>)

<TeamAvatarLayout :members="dag" :showTitle="true" :showPadalinys="false" />

## Studentų iniciatyvų centras

![SIC](</img/dariniai/SIC.jpg>)

<TeamAvatarLayout :members="sic" :showTitle="true" :showPadalinys="false" />

## Atstovų koordinatoriai (-ės)

![Atstovai](</img/dariniai/Atstovai.jpg>)

<TeamAvatarLayout :members="atstovai" :showTitle="false" :showPadalinys="true" />

## Akademinio proceso reikalų koordinatoriai (-ės)

![Akad](</img/dariniai/Akad.jpg>)

<TeamAvatarLayout :members="akademiniai" :showTitle="false" :showPadalinys="true" />

## Socialinio proceso reikalų koordinatoriai (-ės)

![Soc](</img/dariniai/Soc.jpg>)

<TeamAvatarLayout :members="socialiniai" :showTitle="false" :showPadalinys="true" />

## Komunikacijos koordinatoriai (-ės)

![Kom](</img/dariniai/Kom.jpg>)

<TeamAvatarLayout :members="komunikaciniai" :showTitle="false" :showPadalinys="true" />

## Marketingo koordinatoriai (-ės)

![Marketingas](</img/dariniai/Mark.jpg>)

<TeamAvatarLayout :members="marketinginiai" :showTitle="false" :showPadalinys="true" />

## Organizacinės srities koordinatoriai (-ės)

![Organizaciniai](</img/dariniai/Org.jpg>)

<!-- Organizacinės srities koordinatoriai rūpinasi studentų socialine gerove, sprendžia gyvenimo bendrabučiuose, stipendijų ir kitus socialinės dimensijos klausimus. -->

<TeamAvatarLayout :members="organizaciniai" :showTitle="false" :showPadalinys="true" />

## Žmogiškųjų išteklių koordinatoriai (-ės)

![Žmogiškieji](</img/dariniai/HR.jpg>)

<TeamAvatarLayout :members="zmogiskieji" :showTitle="false" :showPadalinys="true" />

## Integracijos proceso koordinatoriai (-ės)

![Integracija](</img/dariniai/Integr.jpg>)

<TeamAvatarLayout :members="integracija" :showTitle="false" :showPadalinys="true" />

## Tarptautinių studentų reikalų koordinatoriai (-ės)

![Tarptautiniai](</img/dariniai/ISAC.jpg>)

<TeamAvatarLayout :members="isac" :showTitle="false" :showPadalinys="true" />

## Administratoriai (-ės)

![Administratoriai](</img/dariniai/Admin.jpg>)

<TeamAvatarLayout :members="administratoriai" :showTitle="false" :showPadalinys="true" />

## Iniciatyvų vadovai (-ės)

![Iniciatyvų vadovai](</img/dariniai/PKP vadovai.jpg>)

<TeamAvatarLayout :members="iniciatyvos" :showTitle="true" :showPadalinys="false" />
