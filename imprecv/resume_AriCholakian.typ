#import "cv.typ": *

#let cvdata = yaml("Content.yml")

#let uservars = (
    headingfont: "PT Serif",
    bodyfont: "PT Serif",
    fontsize: 9pt, // 10pt, 11pt, 12pt
    linespacing: 7pt,
    sectionspacing: 6pt,
    showAddress:  true, // true/false show address in contact info
    showNumber: true,  // true/false show phone number in contact info
    showTitle: true,   // true/false show title in heading
    headingsmallcaps: false, // true/false use small caps for headings
    sendnote: true, // set to false to have sideways endnote
    includeprompt: false //LLM prompt
)

// setrules and showrules can be overridden by re-declaring it here
// #let setrules(doc) = {
//      // add custom document style rules here
//
//      doc
// }

#let customrules(doc) = {
    // add custom document style rules here
    set page(
        paper: "us-letter", // a4, us-letter
        number-align: center, // left, center, right
        margin: 1.25cm, // 1.25cm, 1.87cm, 2.5cm
    )

    doc
}

#let cvinit(doc) = {
    doc = setrules(uservars, doc)
    doc = showrules(uservars, doc)
    doc = customrules(doc)

    doc
}

// each section body can be overridden by re-declaring it here
// #let cveducation = []

// ========================================================================== //

#show: doc => cvinit(doc)

#cvheading(cvdata, uservars)
#cvwork(cvdata)
#cvaffiliations(cvdata)
#cveducation(cvdata)
#cvprojects(cvdata)
#cvawards(cvdata)
#cvcertificates(cvdata)
#cvpublications(cvdata)
#cvskills(cvdata)
#cvreferences(cvdata)
#endnote(uservars)
