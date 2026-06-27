# Kurulum: pip install fastapi uvicorn
# Çalıştırmak için terminale: python -m uvicorn main:app --reload
from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware

app = FastAPI(title="AR Furniture API")

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_methods=["*"],
    allow_headers=["*"],
)

@app.get("/")
def read_root():
    return {"status": "AR Backend is running"}

@app.get("/api/furniture")
def get_furniture():
    # Şimdilik test için internetteki hazır bir 3D model (glb formatında) linki kullanıyoruz.
    return [
        {
            "id": 1,
            "name": "Endüstriyel Masa",
            "texture": "Irish Oak (İrlanda Meşesi)",
            "style": "Minimalist/Industrial",
            # Bu, Google'ın test için sunduğu standart bir 3D modeldir. Gerçekte ahşap bir masa modeli eklenebilir.
            "model_url": "https://modelviewer.dev/shared-assets/models/Chair.glb",
            "scale": "1 1 1" 
        }
    ]


