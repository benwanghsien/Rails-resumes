import { config, library, dom } from "@fortawesome/fontawesome-svg-core"

import { faFile } from "@fortawesome/free-solid-svg-icons/faFile"
import { faFileZipper } from "@fortawesome/free-solid-svg-icons/faFileZipper"
import { faFilePdf } from "@fortawesome/free-solid-svg-icons/faFilePdf"
import { faBold } from "@fortawesome/free-solid-svg-icons/faBold"
import { faItalic } from "@fortawesome/free-solid-svg-icons/faItalic"
import { faHeading } from "@fortawesome/free-solid-svg-icons/faHeading"
import { faQuoteLeft } from "@fortawesome/free-solid-svg-icons/faQuoteLeft"
import { faListUl } from "@fortawesome/free-solid-svg-icons/faListUl"
import { faListOl } from "@fortawesome/free-solid-svg-icons/faListOl"
import { faLink } from "@fortawesome/free-solid-svg-icons/faLink"
import { faImage } from "@fortawesome/free-solid-svg-icons/faImage"
import { faEye } from "@fortawesome/free-solid-svg-icons/faEye"
import { faColumns } from "@fortawesome/free-solid-svg-icons/faColumns"
import { faArrowsAlt } from "@fortawesome/free-solid-svg-icons/faArrowsAlt"
import { faQuestionCircle } from "@fortawesome/free-solid-svg-icons/faQuestionCircle"
import { faRightFromBracket } from "@fortawesome/free-solid-svg-icons/faRightFromBracket"
import { faVideo } from "@fortawesome/free-solid-svg-icons/faVideo"
import { faPeopleGroup } from "@fortawesome/free-solid-svg-icons/faPeopleGroup"

config.mutateApproach = "sync"

library.add(
  faFile,
  faFilePdf,
  faFileZipper,
  faBold,
  faItalic,
  faHeading,
  faQuoteLeft,
  faListUl,
  faListOl,
  faLink,
  faImage,
  faEye,
  faColumns,
  faArrowsAlt,
  faQuestionCircle,
  faRightFromBracket,
  faVideo,
  faPeopleGroup
)
dom.watch()
