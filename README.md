# Typst templates for the University of Duisburg-Essen 📖

![Header](ai-template/figures/ude_header.png)

This repository provides **unofficial** [Typst](https://typst.app/) templates for the [University of Duisburg-Essen](https://www.uni-due.de/). Currently, templates for the following chairs are supported:

- **AI:** Chair of Information Systems and Artificial Intelligence (AI) in Marketing (Prof. Dr. Mario Nadj)
- **SOFTEC:** Lehrstuhl für Wirtschaftsinformatik und Softwaretechnik (Prof. Dr. Stefan Eicker)
- **TM:** Chair of Information Systems and Transformation Management (Prof. Dr. Ralf Plattfaut)

**Important Note:** Please ask your supervisor if you are allowed to use Typst and one of these templates for your thesis or seminar paper. Note that these templates are not checked by the University of Duisburg-Essen or any of its chairs for correctness. For this reason, it is highly recommended that you double-check the output with the official Microsoft Word or LaTeX templates to avoid negative effects on grading.

These templates are provided on a best-effort basis. It is highly recommended that you have at least a basic understanding of Typst syntax in order to correctly use these templates and resolve simple issues without help.

## Usage

These templates are not currently published on the Typst Universe. Therefore, they must be installed manually:

- Download a tarball or fork and clone this repository.
- You may delete all files except the `<chair>-template` directory and the `<chair>-template.typ` file.
- Compile the document using `typst watch <chair>-template.typ` or `typst compile <chair>-template.typ` and open the resulting PDF in a document viewer of your choice.
- You may now replace all content in `<chair>-template.typ` with your thesis content.

## Contributing

Some templates are missing features (e.g., confidentiality notes, _eidesstattliche Versicherung_, etc.). In these cases, help in the form of an issue or pull request is highly appreciated.

If you would like to add your own template, feel free to open a pull request.
