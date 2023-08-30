FROM python:3.10
# Chrome dependency Instalation
RUN apt-get update && apt-get install -y \
    fonts-liberation \
    libasound2 \
    libatk-bridge2.0-0 \
    libatk1.0-0 \
    libatspi2.0-0 \
    libcups2 \
    libdbus-1-3 \
    libdrm2 \
    libgbm1 \
    libgtk-3-0 \
#    libgtk-4-1 \
    libnspr4 \
    libnss3 \
    libwayland-client0 \
    libxcomposite1 \
    libxdamage1 \
    libxfixes3 \
    libxkbcommon0 \
    libxrandr2 \
    xdg-utils \
    libu2f-udev \
    libvulkan1  \
    x11vnc \
    xvfb \
    fluxbox \
    wmctrl \
    curl


 # Chrome instalation 
RUN curl -LO http://dl.google.com/linux/chrome/deb/pool/main/g/google-chrome-stable/google-chrome-stable_115.0.5790.110-1_amd64.deb
RUN apt-get install -y ./google-chrome-stable_115.0.5790.110-1_amd64.deb
RUN rm google-chrome-stable_115.0.5790.110-1_amd64.deb


COPY requirements.txt ./
RUN pip install --upgrade pip   \
    && pip install -r requirements.txt        

# Test Case
COPY selenium /home/apps/selenium
COPY trigger_service /home/apps/trigger_service

 # User  
RUN apt-get -y install sudo
RUN useradd -m apps && echo "apps:apps" | chpasswd && adduser apps sudo
RUN mkdir -p /home/apps \
    && chown -v -R apps:apps /home/apps


# Display
COPY bootstrap.sh /home/apps
RUN chmod 777 /home/apps/bootstrap.sh

CMD '/home/apps/bootstrap.sh'

