# Speech-to-Text-Dataset

A Speech-to-Text dataset scraped from [NPTEL](https://nptel.ac.in/courses/106106184) website.

# Table of Contents

1. [ Aim ](#aim)
2. [ Data ](#data)
3. [ Preprocessing ](#pre)
4. [ Training Manifest File ](#tra)
5. [ Visualization ](#viz)


<a name="aim"></a>
## Aim

To create a data engineering pipeline for curating a Speech-To-Text dataset from publicly available lectures on NPTEL. This task can be challenging, but with the right approach and tools, accurate and high-quality speech recognition models can be achieved. 

<a name="data"></a>
## Data

Collecting audio data is the initial stage in generating a speech recognition dataset. I used the NPTEL lectures available for this task. The lectures are available in various media, including audio and video, and NPTEL offers a substantial number of lectures on various topics. We can download the lecture audio recordings and save them in a central data storage platform.

I used [yt-dlp](https://github.com/yt-dlp/yt-dlp) for reducing the download size/time of the videos. The transcripts were directly downloaded from the [NPTEL](https://nptel.ac.in/courses/106106184) website. 

<a name="pre"></a>
## Preprocessing

### Audio

Firstly, I converted the videos to audio in Jupyter Notebook with windows explorer (Since the size of the videos was large while uploading in Drive). Then uploaded the audio to a google drive for accessing it in Colab. 

We then create a bash script for preprocessing the audio files (make sure that the bash script is executable and converted into Unix format). The bash script converts the audio files to WAV format with a 16KHz sampling rate and mono-channel format. The script takes the audio files, then the preprocessing is applied and converted into wav format. Finally, all the preprocessed audio files are saved.

### Transcripts

The transcripts are also uploaded into google drive for access in Colab. The transcripts can also be imported from the NPTEL Website directly using a Python Script. I chose this way of accessing the transcripts.

First, we extract the transcript from all the PDF files in the transcripts folder and save the transcript in a text file. We then create a list of all the PDF files in the folder. Then, I extracted all the texts from the pdf files. We pre-process the text data by converting it to lowercase, removing punctuations, and converting all digits to their spoken form.

The final transcript preprocessed text had a few spelling errors and some numbers weren't converted into spoken form since they were attached with alphabets.

<a name="tra"></a>
## Training Manifest File

Finally, we read the preprocessed text files and corresponding audio files, calculated the duration of each audio file, and created a list of dictionaries, where each dictionary contains metadata for one audio file. The metadata includes the file path to the audio file, the duration of the audio file, and the text transcribed from the corresponding text file.

The JSON lines file looks like this!

![train_manifest image](https://user-images.githubusercontent.com/89388819/233790900-64ff71b9-8183-47fa-98a4-8974a73dda67.jpg)

<a name="viz"></a>
## Visualization

I created a rough dashboard in Grafana for better visualization.


![Image Dashboard](https://user-images.githubusercontent.com/89388819/233783726-475b0d29-7ed1-41b4-9a72-96097efe097a.jpg)
