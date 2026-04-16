#build stage
FROM python:3.11-slim as builder
WORKDIR /app
COPY requirements.txt .
RUN pip install --user --no-cache-dir -r requirements.txt

#Runtime stage
FROM python:3.11-slim
WORKDIR /app
RUN groupadd -r devopsuser && useradd -r -g devopsuser devopsuser
COPY --from builder /root/.local /home/devopsuser/.local
COPY app.py .

RUN chown -R devopsuser:devopsuser /app /home/devopsuser/.local
USER devopsuser
ENV PATH=/home/devopsuser/.local/bin:$PATH
EXPOSE 5000
CMD ["python", "app.py"]
