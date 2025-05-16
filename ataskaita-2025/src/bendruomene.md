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

</script>

# Ačiū, kad esate kartu

![VU SA](<./public/img/dariniai/VU SA.jpg>)

## Sritys

<PhotoGrid :photos="teamPhotos.lt" />

## Centrinis biuras

![Centrinis biuras](<./public/img/dariniai/CB.jpg>)

<TeamAvatarLayout :members="cb" :showTitle="true" :showPadalinys="false" />

## VU SA Taryba

![Taryba](<./public/img/dariniai/Taryba.jpg>)

<TeamAvatarLayout :members="taryba" :showTitle="false" :showPadalinys="true" />

Daugiau apie Tarybą [skaitykite čia](/vu-sa/taryba.md).

## VU SA Parlamentas

![Parlamentas](<./public/img/dariniai/Parlamentas.jpg>)

Daugiau apie Parlamentą [skaitykite čia](/vu-sa/parlamentas.md).

## ISF

<TeamAvatarLayout :members="isf" :showTitle="true" :showPadalinys="false" />

Daugiau apie ISF [skaitykite čia](/stipri-organizacija/isf.md).

## Duomenų apsaugos grupė

![DAG](<./public/img/dariniai/DAG.jpg>)

<TeamAvatarLayout :members="dag" :showTitle="true" :showPadalinys="false" />

## Studentų iniciatyvų centras

![SIC](<./public/img/dariniai/SIC.jpg>)

## Atstovų koordinatoriai (-ės)

![Atstovai](<./public/img/dariniai/Atstovai.jpg>)

<TeamAvatarLayout :members="atstovai" :showTitle="false" :showPadalinys="true" />

## Akademinio proceso reikalų koordinatoriai (-ės)

![Akad](<./public/img/dariniai/Akad.jpg>)

<TeamAvatarLayout :members="akademiniai" :showTitle="false" :showPadalinys="true" />

## Socialinio proceso reikalų koordinatoriai (-ės)

![Soc](<./public/img/dariniai/Soc.jpg>)

<TeamAvatarLayout :members="socialiniai" :showTitle="false" :showPadalinys="true" />

## Komunikacijos koordinatoriai (-ės)

![Kom](<./public/img/dariniai/Kom.jpg>)

<TeamAvatarLayout :members="komunikaciniai" :showTitle="false" :showPadalinys="true" />

## Marketingo koordinatoriai (-ės)

![Marketingas](<./public/img/dariniai/Mark.jpg>)

<TeamAvatarLayout :members="marketinginiai" :showTitle="false" :showPadalinys="true" />

## Organizacinės srities koordinatoriai (-ės)

![Organizaciniai](<./public/img/dariniai/Org.jpg>)

<!-- Organizacinės srities koordinatoriai rūpinasi studentų socialine gerove, sprendžia gyvenimo bendrabučiuose, stipendijų ir kitus socialinės dimensijos klausimus. -->

<TeamAvatarLayout :members="organizaciniai" :showTitle="false" :showPadalinys="true" />

## Žmogiškųjų išteklių koordinatoriai (-ės)

![Žmogiškieji](<./public/img/dariniai/HR.jpg>)

<TeamAvatarLayout :members="zmogiskieji" :showTitle="false" :showPadalinys="true" />

## Integracijos proceso koordinatoriai (-ės)

![Integracija](<./public/img/dariniai/Integr.jpg>)

<TeamAvatarLayout :members="integracija" :showTitle="false" :showPadalinys="true" />

## Tarptautinių studentų reikalų koordinatoriai (-ės)

![Tarptautiniai](<./public/img/dariniai/ISAC.jpg>)

<TeamAvatarLayout :members="isac" :showTitle="false" :showPadalinys="true" />

## Administratoriai (-ės)

![Administratoriai](<./public/img/dariniai/Admin.jpg>)

<TeamAvatarLayout :members="administratoriai" :showTitle="false" :showPadalinys="true" />

## PKP vadovai

...
