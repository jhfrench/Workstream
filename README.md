Workstream
==========

Integrated timekeeping and workflow system built with CFML and Postgres. Highly-scalable, the system is accessible (508-compliant), and responsive (mobile-enabled).

The general hierarchy is that Customers have one or more projects. Each project has one or more tasks. Task details include owner, QA, due date, start date, hour budget, etc. Notes and hours are entered at the task level (who did what, when, and how long it took).

Invoices aggregate task notes and hours. Workstream supports billing by the hour (via project/resource configured rates), per incident, or for flat-rate projects (including straight-line "burn down" charges).

