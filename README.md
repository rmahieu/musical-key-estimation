# Musical Key Estimation via Machine Learning
## Description
This is a complete, trained system that determines the key of any input music track. Training was done using a small subset of the [Million Song Dataset](https://labrosa.ee.columbia.edu/millionsong/). For information about the system architecture and performance, see the writeup section below. Note that this repo only includes Architecture #2 from the paper, since it seemed to perform significantly better.

## Usage
Simply edit the song filepath in 'main.m' to wherever the file is that you want to process, then run the script.

## Dependencies
This project requires the *Statistics and Machine Learning Toolbox* for MATLAB. It also needs the Chroma Toolbox, but that is included here.

## Writeup
* [Final report](http://robertmahieu.com/docs/mahieu_cs229_final_report.pdf)
* [Poster](http://robertmahieu.com/docs/mahieu_cs229_final_poster.pdf)
